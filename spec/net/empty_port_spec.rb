describe Net::EmptyPort do
  describe "VERSION" do
    subject { Net::EmptyPort::VERSION }
    it { should be_a String }
  end

  describe "empty_port" do
    context "random" do
      let!(:port) { Net::EmptyPort.empty_port }
      it "is between 49152 and 65535" do
        expect(port).to be >= 49152
        expect(port).to be <= 65535
      end
    end
  end

  describe "wait" do
    let!(:port) { Net::EmptyPort.empty_port }
    it "wait until the empty_port is ready" do
      s = TCPServer.new('127.0.0.1', port)
      expect(Net::EmptyPort.wait(port, 2)).to be(true)
      s.close
    end

    it "fails because port is not read while the max_wait" do
      expect(Net::EmptyPort.wait(port, 0.1)).to be(false)
    end
  end
end
