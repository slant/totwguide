class AddAdminUser < ActiveRecord::Migration
  def self.up
    Account.create(
      :login => "slant",
      :email => "rcross@gmail.com",
      :crypted_password => "1bc8fc12d4c204f4e52a584a097d3f01a6ee5199",
      :salt => "706f189588f71227bf43afdfb69c8892f78ce832",
      :admin => true
    )
  end

  def self.down
    Account.find_by_login_and_email('slant','rcross@gmail.com').destroy
  end
end
