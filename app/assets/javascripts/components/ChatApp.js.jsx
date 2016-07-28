var ChatApp = React.createClass({
  getInitialState: function() {
    return(
      { chats: [ ],
        inProgress: false
      }
    );
  },

  addChat: function(e) {
    e.preventDefault();
    var newChats = this.state.chats;
    var participantId = this.state.selectedInputId;

    if(this.state.inputText) {
      newChats.push({ text: this.state.inputText, participantId: participantId})

      this.setState({ 
        chats: newChats,
        messageSent: true,
        selectedInputId: this.state.selectedInputId,
        inputText: ""
      });
    }
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

  render: function(){
    var Grid = ReactBootstrap.Grid;
    var Row = ReactBootstrap.Row;
    var Col = ReactBootstrap.Col;
    var style = {
      minHeight: "600px",
      position: 'relative',
      border: '#e7e9e8 solid .8px'
    }

    return(
      <Grid>
        <Row>
          <Col style={ style } xs={6} md={6} >
            <ChatSection style={ style } messageSent={this.state.messageSent} selectedInputId={ this.state.selectedInputId} chatSectionId={ "1" } addChat= { this.addChat } inputText={ this.state.inputText } inProgress={ this.state.inProgress } handleTextInput= { this.handleTextInput } chats={ this.state.chats }/>
          </Col>
          <Col style={ style } xs={6} md={6} >
            <ChatSection style={ style } messageSent={this.state.messageSent} selectedInputId={ this.state.selectedInputId} chatSectionId={ "2" } addChat= { this.addChat } inputText={ this.state.inputText } inProgress={ this.state.inProgress } handleTextInput= { this.handleTextInput } chats={ this.state.chats }/>
          </Col>
        </Row>
      </Grid>
    );
  }
});
