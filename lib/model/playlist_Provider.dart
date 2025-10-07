import 'package:flutter/material.dart';
import 'package:musicappflutter/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlists = [
    //Song 1
    Song(
      songName: "Bury The Light",
      artistName: "Casey Edwards",
      albumImagepath: "assets/Images/Casey_Edward-Bury_The_Light.jpeg",
      audioPath: "assets/Audio/Casey_Edward-Bury_The_Light.mp3",
    ),
    //Song 2
    Song(
      songName: "Let Down",
      artistName: "Radiohead",
      albumImagepath: "assets/Images/RadioHead-Let_Down.jpeg",
      audioPath: "assets/Audio/Radiohead - Let Down.mp4",
    ),
    // Add more songs here if needed
  ];

  // Current song index
  int _currentSongIndex = 0;
  /*

  G E T T E R S

  */
  List<Song> get playlists => _playlists;
  int get currentSongIndex => _currentSongIndex;

  void setCurrentSongIndex(int index) {
    _currentSongIndex = index;
    notifyListeners();
  }
}