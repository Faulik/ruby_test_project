
# Tests for Credits model
describe Credits do
  describe 'payment types' do
    let(:credit) { Credits.new(6, 10.0 ,100.0) }    

    let(:usual_flat_rounded) {credit.with_usual_payments
                                    .flatten.map { |e| e.round(2) }}
    let(:equal_flat_rounded) {credit.with_equal_payments
                                    .flatten.map { |e| e.round(2) }}

    it 'should calculate right for usual payment type' do

      expect(usual_flat_rounded).to be_a(Array)
      expect(usual_flat_rounded.length).to equal(6 * 4)
      expect(usual_flat_rounded).to include(17.5, 50, 83.33, 17.22)

    end

    it 'should calculate right for equal payment type' do

      expect(equal_flat_rounded).to be_a(Array)
      expect(equal_flat_rounded.length).to equal(6 * 4)
      expect(equal_flat_rounded).to include(16.6, 0.7, 17.16, 33.89)

    end
  end
end