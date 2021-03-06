var ChatSection = React.createClass({
  getInitialState: function() {
    return(
      { chats: this.props.chats }
    );
  },

  render: function(){
    return(
      <div>
        <ChatsList messageSent={this.props.messageSent} selectedInputId={ this.props.selectedInputId } chatSectionId={ this.props.chatSectionId } chats={ this.props.chats } inProgress={ this.props.inProgress } />
        <Form inputId={ this.props.chatSectionId } selectedInputId={ this.props.selectedInputId } inputText={ this.props.inputText } addChat={ this.props.addChat } handleTextInput={ this.props.handleTextInput }/>
      </div>
    );
  }
});
