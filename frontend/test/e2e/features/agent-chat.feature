@e2e
Feature: Agent Chat
  As a logged-in user with Gemini API key configured
  I want to chat with AI agents
  So that I can get AI assistance

  Background:
    Given I am logged in
    And I have configured a Gemini API key in Agent Settings

  Scenario: Agent Chat page loads with model selector
    When I navigate to "/agents/chat"
    Then I should see "Chat Agent" heading
    And I should see model dropdown with available models
    And I should see message input textarea
    And I should see "Send" button

  Scenario: Selecting model persists in localStorage
    Given I am on the Agent Chat page
    When I select a different model from dropdown
    Then the selection should persist after page refresh

  Scenario: Send message shows user message and agent response
    Given I am on the Agent Chat page
    When I type a message and click "Send"
    Then I should see my message in chat with "You" label
    And I should see agent response with "Agent" label

  Scenario: Send button disabled while sending
    Given I have clicked "Send"
    And I wait for response
    Then the button should show "Sending..." and be disabled

  Scenario: Empty message cannot be sent
    Given I have not typed a message
    When I click "Send"
    Then nothing should happen

  Scenario: Missing Gemini key shows error
    Given I have not configured a Gemini API key
    When I navigate to "/agents/chat" and try to send a message
    Then I should see error about missing Gemini key

  Scenario: System message shows in chat
    Given I am on the Agent Chat page
    Then I should see "You are a helpful assistant." as first system message