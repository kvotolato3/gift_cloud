$(document).ready(function(){
  $('.js-claim-container').on('click', '.js-claim', gift_cloud.renderClaimStatuses);
  $('.js-claim-container').on('click', '.js-save-claim', gift_cloud.saveClaim);
});

var gift_cloud = gift_cloud || {}; // namespace

gift_cloud.renderClaimStatuses = function(e) {
  const target = e.target
  for (var i = 0; i < gift_cloud.claimStatuses.length; i++) {
    const status = gift_cloud.claimStatuses[i];
    const element = $('<label><input type="radio" name="claim_status">' + status + '</label>');
    if (status==="Claimed") {
      element.children(":first").prop('checked', true);
    }
    target.parentElement.append(element[0]);
  }

  target.classList.remove('js-claim');
  target.classList.add('js-save-claim');
  target.innerHTML = "Save";
  e.preventDefault();
}

gift_cloud.saveClaim = function(e) {
  const target = e.target
  const userId = target.dataset.userId;
  const userItemId = target.dataset.userItemId;
  const claimStatus = $('input[name=claim_status]:checked').parent().text();
    $.ajax({
    url:'/users/' + userId + "/claims",
    type: 'POST',
    data: {user_item_id: userItemId, status: claimStatus}
  })
  .done(function() {
    console.log( "Success" );
    // TODO: Add an "Unclaim" button for removing the claim - only visible to the user who claimed it!
    // TODO: For user who made claim - Append (claimed) to item text
    // TODO: For user who didn't make claim - Append

  })
  .fail(function(jqXHR, textStatus, errorThrown) {
    console.log(JSON.stringify(jqXHR));
  })
}



gift_cloud.claimStatuses = ["Claimed", "Ordered", "Ready to Wrap", "Wrapped"];



