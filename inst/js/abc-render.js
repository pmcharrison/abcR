function abc_render() {
  ABCJS.renderAbc("paper", abc, {responsive: 'resize'});
  ABCJS.renderMidi("midi", abc);
  ABCJS.renderMidi("midi-download", abc, { generateDownload: true, generateInline: false });
}
