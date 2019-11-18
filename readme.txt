+# IF2121 LOGIKA KOMPUTASIONAL 

# TOKEMON PROLOG 

Untuk menjalankan porgram, semua file yang diperlukan diletakkan dalam 1 folder yang sama. Setelah itu, buka GNU atau SWI PROLOG, lalu pilih consult pada menu file. Kemudian, pilih folder, dimana tempat file-file tersebut berada, dan pilih main.pl. 

# MEMULAI PERMAINAN 

Untuk memulai permainan, ketik 'start.' setelah muncul tulisan yes (setelah menjalankan program). Input command 'help.' untuk mengetahui command-command apa saja yang dapat dimasukkan / digunakan dalam permainan. 
Jika ingin memuat permainan yang disimpan di sebuah file, ketik 'load(<namafile>).' sebelum mengetik 'start.'.

Awal permainan, di inventory akan diberikan 3 tokemon secara acak dengan health penuh, 21 musuh yang terdiri atas 18 tokemon normal dan 18 tokemon legendary dengan health penuh, serta 1 gym. Maksimal inventory adalah 6.
Untuk ukuran map, akan diacak dengan ukuran A*B dengan A dan B dalam rentang 10 hingga 20. Pada map terdapat simbol 'X', '-', 'P', dan 'G'. Simbol 'X' adalah pagar, simbol '-' adalah tanah kosong simbol 'P' adalah Player, dan simbol 'G' adalah Gym.

# PERMAINAN

Player dapat bergerak bebas seuai arah mata angin(n,s,e,w) asal sesuai map.
Saat bertemu musuh, dapat run atau fight. Ketika fight health tokemon yang digunakan dan tokemon musuh akan berkurang setiap attack. Health lawan akan berkurang cukup drastis ketika menggunakan special attack dan health tokemon player tidak berkurang. Apabila musuh kalah, tokemon musuh dapat player capture dan menjadi tokemon player dengan health penuh dan apabila tokemon player kalah, akan otomatis terbuang dari inventory.

# KELUAR DARI PERMAINAN 

Jika ingin menyimpan permainan, ketik 'save(<namafile>).'.
Untuk keluar dari permainan, ketik 'quit.'

# MENANG / KALAH

Player akan menang jika dapat mengalahkan semua tokemon legendary.
Player akan kalah jika inventory player berjumlah 0 atau tidak memiliki tokemon

Selamat Bermain 