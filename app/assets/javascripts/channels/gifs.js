App.messages = App.cable.subscriptions.create('GifsChannel', {  
  received: function(data) {
    return $('#gifs').append(this.renderGif(data));
  },
  renderGif: function(data) {
    return "<p> <b>" + data.gif_id + ": </b></p>" + "<img src='" + data.gif_url + "'";
  }
});

 