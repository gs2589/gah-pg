App.messages = App.cable.subscriptions.create('GifsChannel', {  
  received: function(data) {
    //$("#gifs").removeClass('hidden')
    return $('#gifs').append(this.renderGif(data));
  },
  renderGif: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.gif + "</p>";
  }
});