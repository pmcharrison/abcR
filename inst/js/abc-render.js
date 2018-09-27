function abc_render(abc_data, play_midi, download_midi) {
  ABCJS.renderAbc("abc_image", abc_data, {
    responsive: 'resize'
  });
  if (play_midi) ABCJS.renderMidi("abc_midi_player", abc_data);
  if (download_midi) ABCJS.renderMidi("abc_midi_download", abc_data, {
    generateDownload: true,
    generateInline: false
  });
}
