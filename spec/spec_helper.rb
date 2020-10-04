RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Прописываем, что перед каждым тестом заменяем SmsTool на FakeSms, чтобы не слать реальные смски
  config.before(:each) do
    stub_const("SmsTool", FakeSms)
  end

end
