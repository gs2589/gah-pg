App.messages = App.cable.subscriptions.create('SelectionsChannel', {  
  received: function(data) {
    
    //check game id in player view

    if (data["game"]==parseInt($('.col-md-2 .text-center h4').text().match(/[0-9 -()+]+/)[0])){
      location.reload()
    }

    //check game id in zar player view



    //return $('#gifs').append(this.renderGif(data));
  },
  renderGif: function(data) {
    
    //return "<p> <b>" + data.gif_id + ": </b></p>" + "<img src='" + data.gif_url + "'";
  }
});

 