function abc_render(id, play_midi, download_midi, staffwidth, container_style) {
  console.log("id = " + id);
  document.getElementById("abc_image_" + id).style.cssText = container_style;
  ABCJS.renderAbc("abc_image_" + id, window["abc_data_" + id], {
    staffwidth: staffwidth,
    responsive: 'resize'
  });
  document.getElementById("abc_image_" + id).childNodes[0].style.position = 'static';
  document.getElementById("abc_image_" + id).style.cssText = container_style;
  if (play_midi) ABCJS.renderMidi("abc_midi_player_" + id, window["abc_data_" + id]);
  if (download_midi) ABCJS.renderMidi("abc_midi_download_" + id, window["abc_data_" + id], {
    generateDownload: true,
    generateInline: false
  });
}
