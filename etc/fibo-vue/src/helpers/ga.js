export function outboundClick(name = 'outbound') {
  this.$ga.query('send', 'event', name, 'download', this.tcURL);
}
export function outboundLinkClick(name = 'outbound') {
  this.$ga.query('send', 'event', name, 'click', this.tcURL);
}
