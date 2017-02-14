describe 'env-set' do
  def run_env_set(*args)
    # It defaults to /etc/environment, which ain't useful for tests.
    args << 'spec/environment'
    system("ruby #{Dir.pwd}/bin/env-set #{args.join(' ')}")
  end

  let(:env_file) do
    File.join(Dir.pwd, 'spec', 'environment')
  end

  before(:each) do
    File.open(env_file, 'w') do |file|
      file.puts('A=B')
    end
  end

  let(:result) do
    result = File.readlines(env_file).map(&:chomp)
  end

  it 'backs up the current version'

  # Adding or removing variables.
  describe 'add [var] [value]' do
    it 'adds a new variable' do
      run_env_set('add C D')
      expect(result.length).to eq(2)
      expect(result).to include('A=B')
      expect(result).to include('C=D')
    end

    it 'does not add a variable which is already defined'
  end

  describe 'delete [var]' do
    it 'deletes given variable'
    it 'fails if given variable is not defined'
  end

  # Manipulating values.
  describe 'replace [var] [value]' do
    it 'replaces value of an variable with a new value'
    it 'fails if given variable is not defined'
  end

  # Manipulating arrays.
  describe 'append [var] [item]' do
    it 'appends given item to the array'
    it 'fails if given variable is not defined'
  end

  describe 'prepend [var] [item]' do
    it 'appends given item to the array'
    it 'fails if given variable is not defined'
  end

  describe 'remove [var] [item]' do
    it 'removes an item from the array'
    it 'fails if given variable is not defined'
  end
end
