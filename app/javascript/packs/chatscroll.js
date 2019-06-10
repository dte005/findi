const chatscroll = ()=>{
  const input = document.getElementById('input-chat');
  let content = document.getElementById('chat-content');

  input.addEventListener('focus', (event) => {
    content.scrollTop = content.scrollHeight;
  });

  window.addEventListener('load', function() {
    content.scrollTop = content.scrollHeight;
  });
};

export {chatscroll}
