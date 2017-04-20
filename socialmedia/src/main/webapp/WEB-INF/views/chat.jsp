<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10">
<title>Chat Page</title>
<link rel="stylesheet" href="/cs6320/resources/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="/cs6320/resources/css/design.css" type="text/css" />
<script src="/cs6320/resources/js/jquery-3.1.1.min.js"></script>
<script src="/cs6320/resources/js/bootstrap.min.js"></script>

<script src="/cs6320/resources/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="/cs6320/resources/js/utils.js" type="text/javascript"></script>
<script src="/cs6320/resources/js/sdk/dependencies/socket.io.js" type="text/javascript"></script>
<script src="/cs6320/resources/js/sdk/dependencies/adapter.js" type="text/javascript"></script>
<script src="/cs6320/resources/js/sc.websocket.js" type="text/javascript"></script>
<script src="/cs6320/resources/js/sdk/woogeen.sdk.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="flex-container">
		<nav class="nav">
	   
		    <input type="hidden" name="email" id="uid" value=${email }>
		    <h3>Invite a friend!</h3>
		    <input id="target-uid" type="text">
		    <button id="target-connect">Invite</button>
			<button id="target-video-publish" disabled="true">Start Video Sharing</button>
			<button id="target-video-unpublish" disabled="true">Stop Video Sharing</button>		    
		</nav>
	</div>
	  <article class="article">
	  <div id="sendreceive">
	    <div id="send">
	      <h2>Send message</h2>
	      <textarea id="dataSent" rows="5" cols="10"></textarea>
	     </div>
	    <div id="receive">
	      <h2>Received messages</h2>
	      <textarea id="dataReceived" rows="5" cols="10" disabled="true"></textarea>
	    </div>
	    <button id="data-send">Send message</button>
	  </div>
	  <div id="videocontainer">
	    <div id="local">
	      <h2>Self View</h2>
	      <video width="320px" height="240px" id="localVideo" muted="muted" autoplay="autoplay"></video>
	    </div>
	    <div id="remote">
	      <h2>Friend View</h2>
	      <video width="320px" height="240px" id="remoteVideo" autoplay="autoplay"></video>
	    </div>
	    
	  </div>
  </article>
	<script type="text/javascript">
	
  var isVideo=1;
  var serverAddress='http://192.168.0.101:8095';  // Please change example.com to signaling server's address.
  var p2p=new Woogeen.PeerClient({
    iceServers : [ {
      urls : "stun:61.152.239.60"
    }, {
      urls : ["turn:61.152.239.60:4478?transport=udp","turn:61.152.239.60:4478?transport=tcp"],
      credential : "master",
      username : "woogeen"
    } ]
  });  // Initialize a Peer object
  var localStream;
  var localScreen;

  var getTargetId=function(){
    return $('#target-uid').val();
  };
  
  
	window.onload = function() {
		console.log("salutations");
		p2p.connect({host:serverAddress, token:$('#uid').val()});  // Connect to peer server
	};

  $(document).ready(function(){
    $('#target-connect').click(function(){
      p2p.invite(getTargetId(), function(){
        console.log('Invite success.');
      }, function(err){
        console.log('Invite failed with message: ' + err.message);
      });
    });

    $('#target-screen').click(function(){
      Woogeen.LocalStream.create({
        video:{
          device:"screen"
        }
      }, function(err, stream){
        if (err) {
          return L.Logger.error('create LocalStream failed:', err);
        }
        localScreen = stream;
        p2p.publish(localScreen,$('#target-uid').val());  // Publish local stream to remote client
      });
    });

    $('#target-video-unpublish').click(function(){
      $('#target-video-publish').prop('disabled',false);
      $('#target-video-unpublish').prop('disabled',true);
      p2p.unpublish(localStream,$('#target-uid').val());  // Publish local stream to remote client
      localStream.close();
      localStream = undefined;
    });

    $('#target-video-publish').click(function(){
      $('#target-video-unpublish').prop('disabled',false);
      $('#target-video-publish').prop('disabled',true);
      if(localStream){
          p2p.publish(localStream,$('#target-uid').val());  // Publish local stream to remote client
      }else{
        Woogeen.LocalStream.create({
          video:{
            device:"camera",
            resolution:"hd720p",
            frameRate: [30, 30]
          },
        audio: true
        }, function(err, stream){
          if (err) {
            return L.Logger.error('create LocalStream failed:', err);
          }
          localStream = stream;
          $('#local').children('video').get(0).srcObject=localStream.mediaStream;
          p2p.publish(localStream,$('#target-uid').val());  // Publish local stream to remote client
        });
      }
    });

    $('#target-disconnect').click(function(){
      p2p.stop($('#target-uid').val());  // Stop chat
    });

    $('#login').click(function(){
      p2p.connect({host:serverAddress, token:$('#uid').val()});  // Connect to peer server
      $('#uid').prop('disabled',true);
    });

    $('#logoff').click(function(){
      p2p.disconnect();  // Disconnected from peer server.
      $('#uid').prop('disabled',false);
    });

    $('#data-send').click(function(){
      p2p.send($('#dataSent').val(),$('#target-uid').val());  // Send data to peer.
    });
  });

  p2p.on('chat-invited',function(e){  // Receive invitation from remote client.
    $('#target-uid').val(e.senderId);
    p2p.accept(getTargetId());
    //p2p.deny(e.senderId);
  });

  p2p.on('chat-accepted', function(e){
  });

  p2p.on('chat-denied',function(e){
    console.log('Invitation to '+e.senderId+' has been denied.');
  });

  p2p.on('chat-started',function(e){ // Chat started
    console.log('chat started.');
    $('#target-screen').prop('disabled',false);
    $('#data-send').prop('disabled',false);
    $('#target-video-publish').prop('disabled',false);
  });

  p2p.on('stream-added',function(e){  // A remote stream is available.
    var div = document.createElement("div");
    div.id = e.stream.id();
    var video = document.createElement("video");
    video.setAttribute("width", "320px");
    video.setAttribute("height", "240px");
    video.setAttribute("autoplay", "autoplay");
    video.id = e.stream.id();

    if(e.stream.isScreen()){
      $('#screen video').show();
      $('#screen video').get(0).srcObject=e.stream.mediaStream;
    } else if(e.stream.hasVideo()) {
      $('#remote video').show();
      $('#remote video').get(0).srcObject=e.stream.mediaStream;
    }
    isVideo++;
  });

  p2p.on('stream-removed',function(e){  // A remote stream is available.
    var stream = e.stream;
    if(stream && stream.isScreen()){
      $("#screen video").hide();
    } else {
      $("#remote video").hide();
    }
    console.log('Stream removed. Stream ID: '+e.stream.mediaStream.id);
  });

  p2p.on('chat-stopped',function(e){  // Chat stopped.
    console.log('chat stopped.');
    $('#data-send').prop('disabled',true);
    $('#target-video-publish').prop('disabled',true);
    $('#target-video-unpublish').prop('disabled',true);
    $('#target-screen').prop('disabled',true);
    $('#remote video').hide();
    if(localStream){
      localStream.close();
      localStream=undefined;
    }
    if(localScreen){
      localScreen.close();
      localScreen=undefined;
    }
    console.log('Chat stopped. Sender ID: '+e.senderId+', peer ID: '+e.peerId);
  });

  p2p.on('data-received',function(e){  // Received data from datachannel.
    $('#dataReceived').val(e.senderId+': '+e.data);
  });

  window.onbeforeunload = function(){
    if(localStream){
      p2p.unpublish(localStream,$('#target-uid').val());
      localStream.close();
    }
    p2p.stop($('#target-uid').val());
  }
  </script>

</body>
</html>
