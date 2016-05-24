App.messages = App.cable.subscriptions.create('SelectionsChannel', {  
  received: function(data) {
    location.reload()
    //return $('#gifs').append(this.renderGif(data));
  },
  renderGif: function(data) {
    debugger
    //return "<p> <b>" + data.gif_id + ": </b></p>" + "<img src='" + data.gif_url + "'";
  }
});

 