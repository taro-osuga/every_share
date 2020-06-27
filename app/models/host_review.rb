class HostReview < Review
  belongs_to :host, class_name: "User"

  scope :host_has_reviewed, -> (reservation_id,guest_id){where(
    reservation_id: reservation_id,
    guest_id: guest_id
  )}
end
