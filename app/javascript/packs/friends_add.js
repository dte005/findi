const add_friend = ()=>{
  const button_invite = document.getElementById('add_friend')
  const email_area = document.getElementById('friends_added')
  const email_friend = document.getElementById('email_friend')
  button_invite.addEventListener('click', (event)=>{
    // if(email_friend.value != ""){
    //   email_area.innerHtml += email_friend.value
    // }
    console.log(event)
  });
};

export {add_friend}
