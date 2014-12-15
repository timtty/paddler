require 'trema'

class PaddleSwitch < Controller

  def run
    #denada
  end

  def packet_in(switch_id, packet)
    status = (packet.udp? and packet.total_len < 128) ? 0 : 1
    pkt_type = 'k'

    if packet.udp?
      pkt_type = 'u'
    elsif packet.ipv4?
      pkt_type = 't'
    elsif packet.arp?
      pkt_type = 'a'
    end
    puts "#{time_stamp}|#{packet.macsa}|#{packet.macsa} [#{pkt_type}]|#{packet.total_len}|" +
        "#{packet.total_len}|#{status}"
  end

  private

  def time_stamp
    Time.now.to_i
  end
end