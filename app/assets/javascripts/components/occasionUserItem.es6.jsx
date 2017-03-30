class OccasionUserItem extends React.Component {
  render () {
    return (
      <li>
        {this.props.userItem.name}
        <span className='js-claim-container' >
          <button className='js-claim' data-user-item-id={this.props.userItem.id} data-user-id={this.props.currentUserId}>Claim</button>
        </span>
      </li>
    );
  }
}

Claim.propTypes = {
  userItem: React.PropTypes.object,
  currentUserId: React.PropTypes.string
};
