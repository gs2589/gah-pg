App.messages = App.cable.subscriptions.create('SelectionsChannel', {  
  received: function(data) {
    
    //check game id in player view
      var current_game_id=parseInt($('.col-md-2 .text-center h4').text().match(/[0-9 -()+]+/)[0])
      var current_page_title=$('.view_title').text()
      var needs_refreshing=(current_page_title==="Show_Judge" || current_page_title==="Show_Player_Waiting")
    if (data["game"]==current_game_id && needs_refreshing ){
      location.reload()
    }

    //check game id in zar player view



    //return $('#gifs').append(this.renderGif(data));
  },
  renderGif: function(data) {
    
    //return "<p> <b>" + data.gif_id + ": </b></p>" + "<img src='" + data.gif_url + "'";
  }
});

 