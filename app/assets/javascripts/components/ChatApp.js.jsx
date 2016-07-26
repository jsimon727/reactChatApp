var ChatApp = React.createClass({
  addChat: function() {
    var newChats = this.state.chats
    newChats.push({ text: this.state.inputText})

    this.setState({ 
      chats: newChats,
      messageSent: true,
      selectedInputId: this.state.selectedInputId,
      clearInput: true
    });
  },

  setProgress: function(target){
    if(target.value) {
      return true
    }
    else {
      return false
    }
  },

  handleTextInput: function(event, selectedInputId){
    this.setState({
      inputText: event.target.value,
      inProgress: this.setProgress(event.target),
      selectedInputId: selectedInputId 
    });
  },

  getInitialState: function() {
    return(
      { chats: [ { text: "Type a question or comment in the text field below. Your chat will show up here" } ],
        inProgress: false
      }
    );
  },

  render: function(){
    return(
      <div>
        <ChatSection clearInput={this.state.clearInput} messageSent={this.state.messageSent} selectedInputId={ this.state.selectedInputId} chatSectionId={ "1" } addChat= { this.addChat } inProgress={ this.state.inProgress } handleTextInput= { this.handleTextInput } chats={ this.state.chats }/>
        <ChatSection clearInput={this.state.clearInput} messageSent={this.state.messageSent} selectedInputId={ this.state.selectedInputId} chatSectionId={ "2" } addChat= { this.addChat } inProgress={ this.state.inProgress } handleTextInput= { this.handleTextInput } chats={ this.state.chats }/>
      </div>
    );
  }
});
