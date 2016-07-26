var ChatText = React.createClass({
    render: function(){
      return(
        <li>
          { this.props.text }
          <span>
            { this.props.messageStatus }
          </span>
        </li>
      );
    }
});
