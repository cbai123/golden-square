require 'time_error'

RSpec.describe TimeError do
  it "returns the difference" do
    request = double :requester

    expect(request).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"GMT","client_ip":"188.95.46.98","datetime":"2022-11-16T17:28:23.303038+00:00","day_of_week":3,"day_of_year":320,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668619703,"utc_datetime":"2022-11-16T17:28:23.303038+00:00","utc_offset":"+00:00","week_number":46}')

    difference = TimeError.new(request)

    current_time = Time.new(2022,11,16,17,28,23)

    expect(difference.error(current_time)).to eq 0.303038
  end
end