export function outboundClick(name = 'outbound') {
  this.$ga.query('send', 'event', name, 'download', this.tcURL);
}
