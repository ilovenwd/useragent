
s = 'Appcelerator Titanium/2.1.3.GA (iPad/6.0.1; iPhone OS; zh_CN;)'

describe "UserAgent: '#{s}'" do
  before do
    s = 'Appcelerator Titanium/2.1.3.GA (iPad/6.0.1; iPhone OS; zh_CN;)'
    @useragent = UserAgent.parse(s)
  end

  it { @useragent.should be_mobile }
  it { @useragent.should_not be_bot }
  it { @useragent.os.should == 'iPhone OS' }
  it { @useragent.platform.should == 'iPad' }
  it { @useragent.browser.should == 'Titanium' }
  it { @useragent.version.should == '2.1.3.GA' }
end

