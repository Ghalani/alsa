# require 'rails_helper'

# describe OrganizationPolicy do
#   subject { OrganizationPolicy }

#   let (:current_user) { FactoryGirl.build_stubbed :user }
#   let (:other_user) { FactoryGirl.build_stubbed :user }
#   let (:admin) { FactoryGirl.build_stubbed :user, :admin }

#   before do
#   	current_user.member_organizations << admin.organizations.first
#   end

#   permissions :index? do
#   	#print "index"
#     it "denies access if not an admin" do
#       expect(UserPolicy).not_to permit(current_user, admin.organizations.first)
#     end
#     it "allows access for an admin" do
#       expect(UserPolicy).to permit(admin, admin.organizations.first)
#     end
#   end

#   permissions :show? do
#   	#print "show"
#     it "prevents non-memeber of Organization from seeing your it" do
#       expect(subject).not_to permit(other_user, admin.organizations.first)
#     end
#     it "allows member to see Organization dashboard" do
#       expect(subject).to permit(current_user, admin.organizations.first)
#     end
#     it "allows an admin to see any Organization" do
#       expect(subject).to permit(admin, admin.organizations.first)
#     end
#   end

#   permissions :update? do
#   	#print "update"
#     it "prevents updates if not an admin" do
#       expect(subject).not_to permit(current_user, admin.organizations.first)
#     end
#     it "allows an admin to make updates" do
#       expect(subject).to permit(admin, admin.organizations.first)
#     end
#   end

#   permissions :destroy? do
#     it "prevents deleting Organization if there are 1 or more members" do
#       expect(subject).not_to permit(current_user, admin.organizations.first)
#     end

#     it "prevents deleting Organization if not an admin" do
#       expect(subject).not_to permit(current_user, admin.organizations.second)
#     end

#     it "allows deleting Organization if there are no members and user is an admin" do
#       expect(subject).to permit(admin, admin.organizations.second)
#     end
#   end

# end