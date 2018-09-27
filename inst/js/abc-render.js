function abc_render() {
  ABCJS.renderAbc("paper", abc);
  ABCJS.renderMidi("midi", abc);
  ABCJS.renderMidi("midi-download", abc, { generateDownload: true, generateInline: false });
}
