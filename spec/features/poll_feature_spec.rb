require "rails_helper"

describe "poll features", :type => :feature do
  before :each do
end

  it "signs me in" do
    before = Poll.count

    visit '/poll/index'
    click_button 'Create Poll'
    fill_in 'poll_name', :with => 'My first poll'
    fill_in 'poll_choices_attributes_0_name', :with => '1st choice'
    fill_in 'poll_choices_attributes_1_name', :with => '2nd choice'
    fill_in 'poll_choices_attributes_2_name', :with => '3rd choice'
    fill_in 'poll_choices_attributes_3_name', :with => '4th choice'
    click_button 'Create'
    
    #within("#session") do    
    #fill_in '', :with => 'password'
    #click_button 'Sign in'
    expect(Poll.count).to eq(before + 1)
    poll = Poll.last
    expect(poll.name).to eq('My first poll' )
    expect(poll.choices.length).to eq(4)
  end

  it "can vote" do
    before = Poll.count

    visit '/poll/index'
    click_button 'Create Poll'
    fill_in 'poll_name', :with => 'My first poll'
    fill_in 'poll_choices_attributes_0_name', :with => '1st choice'
    fill_in 'poll_choices_attributes_1_name', :with => '2nd choice'
    fill_in 'poll_choices_attributes_2_name', :with => '3rd choice'
    fill_in 'poll_choices_attributes_3_name', :with => '4th choice'
    click_button 'Create'
    
    #expect{
      choose("radio_#{Choice.last.id}")
      click_button 'Vote'
    #}.to_not raise_error
    poll = Poll.last
    expect(poll.selected_choice_id).to eq(Choice.last.id)
  end
end