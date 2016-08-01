function reloadIfNewMonarch(user_id){

  setInterval(function(){
    $.get( "/"+user_id+"/check_monarch", function( data ) {
      // console.log(data)
      console.log(data);
      if (data === false) {
        window.location.reload();
      }

      });
  }, 3000)

}
