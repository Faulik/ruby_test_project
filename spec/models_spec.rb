
# Tests for Credits model
describe Credits do
  describe 'class initialization' do
  
    it 'should return class' do
      credit = Credits.new(12, 10, 300)

      expect(credit).to be_instance_of(Credits)
    end
  end

  describe 'payment types' do
    let(:usual_pay_array) {Credits.new(6, 10.0 ,100.0).with_usual_payments} 
    let(:equal_pay_array) {Credits.new(6, 10.0 ,100.0).with_equal_payments}

    let(:usual_flat_rounded) {usual_pay_array.flatten!.map! { |e| e.round(2) }}
    let(:equal_flat_rounded) {equal_pay_array.flatten!.map! { |e| e.round(2) }}

    it 'should calculate right for usual payment type' do

      expect(usual_pay_array).to be_a(Array)
      expect(usual_pay_array.length).to equal(6)
      expect(usual_flat_rounded).to include(17.5, 50, 83.33, 17.22)

    end
    
    it 'should calculate right for equal payment type' do

      expect(equal_pay_array).to be_a(Array)
      expect(equal_pay_array.length).to equal(6)
      expect(equal_flat_rounded).to include(16.6, 0.7, 17.16, 33.89)

    end
  end
end