class Claim extends React.Component {
  render () {
    return (
      <span className='js-claim-container' >
        <button className='js-claim' data-user-item-id={this.props.userItemId} data-user-id={this.props.currentUserId}>Claim</button>
      </span>
    );
  }
}

Claim.propTypes = {
  userItemId: React.PropTypes.string,
  currentUserId: React.PropTypes.string
};
