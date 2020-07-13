# encoding: UTF-8

RSpec.describe 'f39' do

  context '{f39} passes locale config verifications', :locale do
    context 'by having correct configs' do
      it 'w/ HTTP version{1.1}' do
        expect(::Net::HTTP::HTTPVersion).to eq('1.1')
      end
      it 'is marked multi-user safe' do
        expect(::Net::HTTP::ENVIRONMENT_VARIABLE_IS_MULTIUSER_SAFE).to eq(true)
      end
    end
  end # end: {defines{f39}}

end
