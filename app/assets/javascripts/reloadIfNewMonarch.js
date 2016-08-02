function reloadIfNewMonarch(user_id){

  setInterval(function(){
    $.get( "/"+user_id+"/check_monarch", function( data ) {
      if (data === false) {
        window.location.reload();
      }

    });
  }, 10000)

}
