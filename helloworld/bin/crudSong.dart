import 'dart:io';

class Song {
  String name;
  String author;

  Song(this.name, this.author);

}

class AddressSong {
  List<Song> songs = [];

  void addSong(Song song) {
    songs.add(song);
  }

  void removeSong(String name) {
    songs.removeWhere((song) => song.name == name);
  }

  void updateSongAuthor(String name, String newAuthor) {
    var songToUpdateIndex = songs.indexWhere((song) => song.name == name);
    if (songToUpdateIndex != -1) {
      songs[songToUpdateIndex].author = newAuthor;
      print("Tác giả của bài hát đã được cập nhật.");
    } else {
      print("Không tìm thấy bài hát để cập nhật.");
    }
  }


  void displaySongs() {
    if (songs.isEmpty) {
      print("Danh sách trống.");
      print("Vui lòng thêm bài hát");
    } else {
      print("Danh sách bài hát:");
      for (var song in songs) {
        print("Tên : ${song.name}, Tác giả: ${song.author}");
      }
    }
  }
}

void main() {
  var addressSong = AddressSong();
  while (true) {
    print("\nCác lựa chọn của bạn: ");
    print("1. Thêm bài hát ");
    print("2. Xóa bài hát ");
    print("3. Cập nhật tác giả bài hát");
    print("4. Danh sách bài hát");
    print("5. Thoát ");
    var readLineSync = stdin.readLineSync();
    if (readLineSync == null || readLineSync.isEmpty) {
      print("Bạn chưa chọn gì.");
      print("Vui lòng chọn mục bạn muốn.");
      continue;
    }
    var choice = int.tryParse(readLineSync);
    if (choice == null) {
      print("Lựa chọn không hợp lệ.");
      continue;
    }

    switch (choice) {
      case 1:
        print("Nhập tên bài hát:");
        var name = stdin.readLineSync();
        print("Nhập tên tác giả");
        var author = stdin.readLineSync();
        var song = Song(name!, author!);
        addressSong.addSong(song);
        print("Bài hát đã được thêm");
        break;

      case 2:
        print("Nhập tên bài hát để xóa: ");
        var name = stdin.readLineSync();
        addressSong.removeSong(name!);
        print("Bài hát đã được xóa");
        break;

      case 3:
        print("Nhập tên bài hát cần cập nhật tác giả: ");
        var name = stdin.readLineSync();
        print("Nhập tác giả mới: ");
        var newAuthor = stdin.readLineSync();
        addressSong.updateSongAuthor(name!, newAuthor!);
        break;

      case 4:
        addressSong.displaySongs();
        break;

      case 5:
        print("Kết thúc");
        return;

      default:
        print("Không hợp lệ");
    }
  }
}
