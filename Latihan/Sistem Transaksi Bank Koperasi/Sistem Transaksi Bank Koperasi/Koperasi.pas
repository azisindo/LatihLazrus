Program Sistem_Bank_Koperasi;
uses crt;

{Untuk Menjalankan Program Terlebih Dahulu Membuat Nasabah.txt & Rekening.txt Dalam 1 Folder}

{deklarasi}
type nasabah = record
   NOid1         : word;
   nama          : string;
   alamat        : string;
   pekerjaan     : string;
   penghasilan   : string;
   noktp         : string;
   kota          : string;
   ttl           : string;
end;

type rekening = record
   NOid2         : word;
   tabung        : longint;
   tarik         : longint;
   saldoawal     : longint;
   saldo1        : longint;
   saldo2        : longint;
   tanggal       : string;
   username      : string;
end;

var
fb            : file of nasabah;
vb            : file of rekening;
rb            : nasabah;
zb            : rekening;
i             : byte;
jumlah,no,z   : integer;
kode          : integer;
ada           : boolean;
NOCR1         : word;
NOCR2         : word;
lagi,ya       : char;


{Tampilan Awal}
Procedure Tampilan;
begin
clrscr;
for i:= 1 to 23 do
 begin
  delay(120);
  gotoxy(28,i);textcolor(10); write('*** WELCOME FOR OPERATOR ***');
  gotoxy(28,i-1);write('                            ');
 end;
 begin
 for i:= 23 downto 2 do
 begin
  delay(120);
  gotoxy(25,i);textcolor(10); write('*** SISTEM INFORMASI KOPERASI ***');
  gotoxy(25,i+1);write('                                 ');
 end;
textcolor(10);
 gotoxy(21,4);write('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
 gotoxy(21,6);write('PROGRAM APLIKASI SISTEM TRANSAKSI BANKING');
 gotoxy(37,10);write('KOPERASI');
 gotoxy(25,14);write('PENYIMPANAN DAN PENARIKAN TABUNGAN');
 gotoxy(21,16);write('ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');
 gotoxy(39,18);write('****');
 readln;
 end;
end;

{MENU}
Procedure Menu;
begin
clrscr;
textcolor(11);
writeln;
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                    * D A F T A R  M E N U  T R A N S A K S I *');
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('                               -=-=Acount Option=-=-');
writeln;
writeln('                    1> Buat Akun Baru Nasabah');
writeln('                    2> Rekening Nasabah');
writeln('                    3> Edit Data Akun Nasabah');
writeln('                    4> Hapus Record Data');
writeln('                    5> Daftar Data Akun');
writeln('                    6> Cari Data Akun Nasabah');
writeln('                    7> Tentang Kami');
writeln('                    8> Bantuan');
writeln('                    9> Keluar');
writeln;
end;

{BUKA FILE1}
Procedure Buka_File1;
begin
assign(fb,'Nasabah.txt');
 {$I-};
 reset(fb);
 {$I+};
end;

{BUKA FILE2}
Procedure Buka_File2;
begin
assign(vb,'Rekening.txt');
 {$I-};
 reset(vb);
 {$I+};
end;

{AKUN BARU}
Procedure Akun_Baru;
begin
lagi:='Y';
clrscr;

Buka_File1;
 if ioresult<>0 then rewrite(fb);
repeat
clrscr;
ada:=false;
z:=0;
textcolor(15);
writeln;
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                    * P R O G R A M  A K U N  N A S A B A H *');
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('                    Ket : (Huruf/Angka, Maksimum)');
writeln;
write('                      ID Nasabah (4)   : ');readln(NOCR1);
while (ada=false) and (z<>filesize(fb)) do
begin
seek(fb,z);
read(fb,rb);
if rb.NOid1=NOCR1 then
ada:=true
else
inc(z);
end;
if (ada=true) then
begin
writeln;
write('                      Nomor ID Nasabah "',NOCR1,'" ini Sudah ada');
writeln;
end
else
begin
seek(fb,filesize(fb));
rb.NOid1:=NOCR1;
write('                      Nama (12)        : ');readln(rb.nama);
write('                      Alamat (24)      : ');readln(rb.alamat);
write('                      Pekerjaan (10)   : ');readln(rb.pekerjaan);
write('                      Penghasilan (10) : ');readln(rb.penghasilan);
clrscr;
writeln;
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                    * P R O G R A M  D A T A  P R I B A D I *');
writeln('                    =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('                    Ket : (Huruf/Angka, Maksimum)');
writeln;
write('                      NO.KTP (16)       : ');readln(rb.noktp);
write('                      Kota Tinggal (18) : ');readln(rb.kota);
write('                      TTL (28)          : ');readln(rb.ttl);
writeln;
writeln('                    Selamat Data Telah Berhasil dibuat!');
writeln('                    Nomor ID Anda : ',rb.NOid1);
 write(fb,rb);
end;
writeln;
write('                      Masukan Data Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
close(fb)
end;

{SALDO PERTAMA}
Procedure Saldo_Pertama;
begin
lagi:='Y';
clrscr;

Buka_File2;
if ioresult<>0 then rewrite(vb);
repeat
clrscr;
ada:=false;
z:=0;
clrscr;
textcolor(10);
writeln;
writeln('              =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('              * P R O G R A M  I N P U T  S A L D O  P E R T A M A *');
writeln('              =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
write('                Masukan ID Nasabah : ');readln(NOCR2);
while (ada=false) and (z<>filesize(vb)) do
begin
seek(vb,z);
read(vb,zb);
if zb.NOid2=NOCR2 then
ada:=true
else
inc(z);
end;
if (ada=true) then
begin
writeln;
write('                Nomor ID Nasabah "',NOCR2,'" ini Sudah ada');
writeln;
end
else
begin
seek(vb,filesize(vb));
zb.NOid2:=NOCR2;
writeln;
write('                Inputkan Username Anda : ');readln(zb.username);
writeln;
writeln('              * Minimal Jumlah Rekening Rp.10.000,.');
writeln('              ======================================================');
write('                Jumlah Uang yang Ingin Anda Tabung : Rp.');readln(zb.saldoawal);
write('                Tanggal Transaksi (DD/MM/YYYY)     : ');readln(zb.tanggal);
writeln;
writeln('              Selamat Saldo Telah Berhasil disimpan!');
writeln;
writeln('              * Rekening Anda   : ',zb.saldoawal);
writeln('              * Dengan Username : ',zb.username);
write(vb,zb);
end;
writeln;
write('                Masukan Data Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
close(vb)
end;

{BANK}
Procedure Bank;
begin
writeln('                 * Silahkan Lakukan Transaksi');
writeln;
writeln('                    Menu Transaksi : ');
writeln('                    1. Transaksi Penyimpanan');
writeln('                    2. Transaksi Penarikan');
zb.saldo1 := zb.saldoawal;
writeln;
write('                    Pilihan Transaksi : ');readln(kode);
writeln;
if kode = 1 then
            begin
            write('                 * Jumlah yang Anda Tabung Sebesar : Rp.');readln(zb.tabung);
            zb.saldo2:=zb.saldo1+zb.tabung;
            end
            else if kode = 2 then
               begin
               write('                 * Jumlah yang Anda Tarik Sebesar : Rp.');readln(zb.tarik);
               zb.saldo2:=zb.saldo1-zb.tarik;
               end
               else
               writeln('                 * Maaf, Kode Transaksi yang Anda Inputkan Salah');
if ((kode=1) or (kode=2)) then
            if (zb.saldo2<10000) then
            begin
            writeln('                 * Maaf, Saldo Minimum Anda Haruslah Rp.10.000');
            zb.saldo2:=zb.saldo1;
            end
            else
               begin
               writeln('                 * Saldo Anda Menjadi : Rp.',zb.saldo2);
 end;
end;

{TRANSAKSI}
Procedure Transaksi;
begin
Lagi:='Y';
clrscr;

Buka_File2;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
repeat
clrscr;
ada:=false;
z:=0;
textcolor(10);
writeln;
writeln('               =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('               * P R O G R A M  T R A N S A K S I  N A S A B A H *');
writeln('               =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
write('                 Masukan ID Nasabah : ');readln(NOCR2);
while (ada=false) and (z<>filesize(vb)) do
begin
seek(vb,z);
read(vb,zb);
if zb.Noid2=NOCR2 then
begin
ada:=true;
writeln;
writeln('               * Username ',zb.username);
writeln('               * Anda Memiliki Saldo Sebesar Rp.',zb.saldoawal);
writeln('               * Pada Tanggal ',zb.tanggal,' Transaksi Terakhir');
writeln('               ===================================================');
end
else
inc(z);
end;
if (ada<>true) then
begin
writeln;
writeln('                 Nomor ID Nasabah "',NOCR2,'" ini Tidak ada');
writeln;
writeln('                 * Bila Tidak ada Saldo yang di Tampilkan');
writeln('                   Jangan Lakukan Transaksi!');
end;
Bank;
if (ada=true) then
begin
zb.NOid2:=NOCR2;
writeln('               ===================================================');
write('               * Inputkan Jumlah Saldo diatas Rp.');readln(zb.saldoawal);
write('               * Tanggal Transaksi Saat ini (DD/MM/YYYY) : ');readln(zb.tanggal);
seek(vb,z);
write(vb,zb);
end;
writeln;
write('                 Ingin Melakukan Transaksi Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
close(vb);
 end;
end;

{CEK SALDO}
Procedure Cek_Saldo;
begin
Lagi:='Y';
clrscr;

Buka_File2;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
repeat
clrscr;
ada:=false;
z:=0;
textcolor(10);
writeln;
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                       * C E K  S A L D O  N A S A B A H *');
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
write('                         Masukan ID Nasabah : ');readln(NOCR2);
while (ada=false) and (z<>filesize(vb)) do
begin
seek(vb,z);
read(vb,zb);
if zb.Noid2=NOCR2 then
begin
ada:=true;
writeln;
writeln('                         * Username ',zb.username);
writeln('                         * Pada Tanggal ',zb.tanggal);
writeln;
writeln('                           Saldo Anda yang Tersimpan');
writeln('                         =================================');
writeln('                           Saldo Nasabah : ',zb.saldoawal);
end
else
inc(z);
end;
if (ada<>true) then
begin
writeln;
write('                       Nomor ID Nasabah "',NOCR2,'" ini Tidak ada');
writeln;
end;
writeln;
write('                         Ingin Cek Saldo Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
 close(vb);
end;
 end;

{EDIT DATA}
Procedure Edit_Data;
begin
Lagi:='Y';
clrscr;

Buka_File1;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
repeat
clrscr;
ada:=false;
z:=0;
textcolor(14);
writeln;
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                       * E D I T  D A T A  N A S A B A H *');
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('                       Ket : (Huruf/Angka, Maksimum)');
writeln;
write('                         ID Nasabah (4)   : ');readln(NOCR1);
while (ada=false) and (z<>filesize(fb)) do
begin
seek(fb,z);
read(fb,rb);
if rb.Noid1=NOCR1 then
begin
ada:=true;
writeln;
writeln('                       Data Anda Saat ini');
writeln('                       ===================================');
writeln('                       * Data Baru Nasabah');
writeln;
writeln('                         Nama (12)        : ',rb.nama);
writeln('                         Alamat (24)      : ',rb.alamat);
writeln('                         Pekerjaan (10)   : ',rb.pekerjaan);
writeln('                         Penghasilan (10) : ',rb.penghasilan);
writeln;
writeln('                       * Data Pribadi Nasabah');
writeln;
writeln('                         NO.KTP (16)       : ',rb.noktp);
writeln('                         Kota Tinggal (18) : ',rb.kota);
writeln('                         TTL (28)          : ',rb.ttl);
writeln('                       ===================================');
end
else
inc(z);
end;
if (ada=true) then
begin
rb.NOid1:=NOCR1;
readln;
clrscr;
writeln;
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                       * E D I T  D A T A  N A S A B A H *');
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('                       Silahkan Edit Data Anda');
writeln('                       ===================================');
writeln('                       * Data Baru Nasabah');
writeln;
write('                         Nama (12)        : ');readln(rb.nama);
write('                         Alamat (24)      : ');readln(rb.alamat);
write('                         Pekerjaan (10)   : ');readln(rb.pekerjaan);
write('                         Penghasilan (10) : ');readln(rb.penghasilan);
writeln;
writeln('                       * Data Pribadi Nasabah');
writeln;
write('                         NO.KTP (16)       : ');readln(rb.noktp);
write('                         Kota Tinggal (18) : ');readln(rb.kota);
write('                         TTL (28)          : ');readln(rb.ttl);
writeln('                       ===================================');
seek(fb,z);
write(fb,rb);
end
else
begin
writeln;
writeln('                       Nomor ID Nasabah "',NOCR1,'" ini Tidak ada');
end;
writeln;
write('                       Edit Data Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
end;
close(fb);
end;

{HAPUS DATA NASABAH}
Procedure Hapus_Data_Nasabah;
begin
lagi:='Y';
assign(fb,'Nasabah.txt');
reset(fb);
begin
repeat
clrscr;
textcolor(15);
writeln;
writeln('                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('                * H A P U S  R E C O R D  D A T A  N A S A B A H *');
writeln('                =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
jumlah:=filesize(fb);
writeln('                * Jumlah Data yang Tersimpan : ',jumlah);
writeln;
write('                  Masukan ID Nasabah : ');readln(no);
writeln;
if (no < 1) or (no > jumlah) then
begin
writeln('                  Nomor Record "',no,'" Tidak Tersedia!');
writeln;
write('                * Ingin Mencari Record Lagi (Y/T) ');lagi:=upcase(readkey);
end
else
begin
for i:=no to jumlah do
begin
seek(fb,i-1);
read(fb,rb);
with rb do
begin
writeln('                  Data Anda yang Tersimpan');
writeln('                  ===================================');
writeln('                * Data Baru Nasabah');
writeln;
writeln('                  No ID            : ',rb.NOid1);
writeln('                  Nama (12)        : ',rb.nama);
writeln('                  Alamat (24)      : ',rb.alamat);
writeln('                  Pekerjaan (10)   : ',rb.pekerjaan);
writeln('                  Penghasilan (10) : ',rb.penghasilan);
writeln;
writeln('                * Data Pribadi Nasabah');
writeln;
writeln('                  NO.KTP (16)       : ',rb.noktp);
writeln('                  Kota Tinggal (18) : ',rb.kota);
writeln('                  TTL (28)          : ',rb.ttl);
writeln('                  ===================================');
writeln;
 end;
end;
write('                * Ingin Menghapus Data yang ini (Y/T) ?');ya:=upcase(readkey);
if upcase(ya) = 'Y' then
begin
seek(fb,no-1);
truncate(fb);
end;
writeln;
writeln;
write('                * Ingin Mencari Data yang Lain (Y/T) ?');lagi:=upcase(readkey);
end;
until lagi<>'Y';
 close(fb);
end;
 end;

{HAPUS DATA REKENING}
Procedure Hapus_Data_Rekening;
begin
lagi:='Y';
assign(vb,'Rekening.txt');
reset(vb);
begin
repeat
clrscr;
textcolor(15);
writeln;
writeln('               =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('               * H A P U S  R E C O R D  D A T A  R E K E N I N G *');
writeln('               =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
jumlah:=filesize(vb);
writeln('               * Jumlah Data yang Tersimpan : ',jumlah);
writeln;
write('                 Masukan ID Nasabah : ');readln(no);
writeln;
if (no < 1) or (no > jumlah) then
begin
writeln('                 Nomor Record "',no,'" Tidak Tersedia!');
writeln;
write('               * Ingin Mencari Record Lagi (Y/T) ');lagi:=upcase(readkey);
end
else
begin
for i:=no to jumlah do
begin
seek(vb,i-1);
read(vb,zb);
with zb do
begin
writeln('                 Data Anda yang Tersimpan ');
writeln('                 Pada Tanggal ',zb.tanggal);
writeln('                 ===================================');
writeln('               * Data Transaksi');
writeln;
writeln('                 No ID              : ',zb.NOid2);
writeln('                 Username           : ',zb.username);
writeln('                 Saldo Nasabah      : ',zb.saldoawal);
writeln('                 ===================================');
writeln;
 end;
end;
write('               * Ingin Menghapus Data yang ini (Y/T) ?');ya:=upcase(readkey);
if upcase(ya) = 'Y' then
begin
seek(vb,no-1);
truncate(vb);
end;
writeln;
writeln;
write('               * Ingin Mencari Data yang Lain (Y/T) ?');lagi:=upcase(readkey);
end;
until lagi<>'Y';
 close(vb);
end;
 end;

{DAFTAR DATA NASABAH}
Procedure Daftar_Data_Nasabah;
begin
lagi:='Y';
clrscr;
repeat
Buka_File1;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
clrscr;
writeln;
textcolor(10);
writeln('        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('        * P R O G R A M  D A F T A R  D A T A  N A S A B A H  A K U N *');
writeln('        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('~DATA NASABAH~');
writeln('ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('³  ID  ³      NO.KTP      ³    Kota Tinggal    ³     Tempat Tanggal Lahir     ³');
writeln('ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´');
while not eof (fb) do
 begin
  read(fb,rb);
  with rb do
writeln('³':1,rb.NOid1:6,'³':1,rb.noktp:18,'³':1,rb.kota:20,'³':1,rb.ttl:30,'³':1);
end;
writeln('ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
 writeln;
 close(fb);
end;
writeln;
write('* Tekan "Enter" Untuk Kembali ke Menu Utama...');lagi:=upcase(readkey)
until lagi<>'Y';
end;

{DAFTAR DATA PRIBADI}
Procedure Daftar_Data_Pribadi;
begin
lagi:='Y';
clrscr;
repeat
Buka_File1;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
clrscr;
writeln;
textcolor(10);
writeln('        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('        * P R O G R A M  D A F T A R  D A T A  P R I B A D I  A K U N *');
writeln('        =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('~DATA PRIBADI~');
writeln('ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('³  ID  ³     Nama     ³          Alamat          ³  Pekerjan  ³  Penghasilan  ³');
writeln('ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´');
while not eof (fb) do
 begin
  read(fb,rb);
  with rb do
writeln('³':1,rb.NOid1:6,'³':1,rb.nama:14,'³':1,rb.alamat:26,'³':1,rb.pekerjaan:12,'³',rb.penghasilan:15,'³':1);
end;
writeln('ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
 writeln;
 close(fb);
end;
writeln;
write('* Tekan "Enter" Untuk Kembali ke Menu Utama...');lagi:=upcase(readkey)
until lagi<>'Y';
end;

{DAFTAR SALDO NASABAH}
Procedure Daftar_Saldo_Nasabah;
begin
lagi:='Y';
clrscr;
repeat
Buka_File2;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
clrscr;
writeln;
textcolor(10);
writeln('       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('       * P R O G R A M  D A F T A R  S A L D O  N A S A B A H  A K U N *');
writeln('       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('~DATA SALDO NASABAH~');
writeln('ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿');
writeln('³  ID  ³   Username   ³          Saldo Nasabah          ³  Tanggal Transaksi  ³');
writeln('ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´');
while not eof (vb) do
 begin
  read(vb,zb);
  with zb do
writeln('³':1,zb.NOid2:6,'³':1,zb.username:14,'³':1,zb.saldoawal:33,'³':1,zb.tanggal:21,'³':1);
end;
writeln('ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ');
 writeln;
 close(vb);
end;
writeln;
write('* Tekan "Enter" Untuk Kembali ke Menu Utama...');lagi:=upcase(readkey)
until lagi<>'Y';
end;

{CARI DATA}
Procedure Cari_Data;
begin
Lagi:='Y';
clrscr;

Buka_File1;
if ioresult<>0 then
writeln('                    *** Tidak ada Data yang di Tampilkan ***')
else
begin
repeat
clrscr;
ada:=false;
z:=0;
textcolor(14);
writeln;
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                       * C A R I  D A T A  N A S A B A H *');
writeln('                       =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
write('                         ID Nasabah : ');readln(NOCR1);
while (ada=false) and (z<>filesize(fb)) do
begin
seek(fb,z);
read(fb,rb);
if rb.Noid1=NOCR1 then
begin
ada:=true;
writeln;
writeln('                       Data Anda yang Tersimpan');
writeln('                       ===================================');
writeln('                       * Data Baru Nasabah');
writeln;
writeln('                         Nama             : ',rb.nama);
writeln('                         Alamat           : ',rb.alamat);
writeln('                         Pekerjaan        : ',rb.pekerjaan);
writeln('                         Penghasilan      : ',rb.penghasilan);
writeln;
writeln('                       * Data Pribadi Nasabah');
writeln;
writeln('                         NO.KTP           : ',rb.noktp);
writeln('                         Kota Tinggal     : ',rb.kota);
writeln('                         TTL              : ',rb.ttl);
writeln('                       ===================================');
end
else
inc(z);
end;
if (ada<>true) then
begin
writeln;
write('                       Nomor ID Nasabah "',NOCR1,'" ini Tidak ada');
writeln;
end;
writeln;
write('                       * Ingin Mencari Data Lagi (Y/T) ?');lagi:=upcase(readkey);
until lagi<>'Y';
 close(fb);
end;
 end;

{Tentang Kami}
Procedure Tentang_Kami;
begin
lagi:='Y';
clrscr;
repeat
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                          * T E N T A N G  K A M I *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     Kami dari kelompok Algoritma dan Pemrogranan II yang beranggotakan : ');
writeln;
writeln('     * Septian Maulana     1141177004039');
writeln('     * Meydina Aryani      1141177004047');
writeln('     * Zogi Ani Sulvahmi   1141177004045');
writeln('     * Tyas Aditya         1141177004053');
writeln;
writeln('        Alhamdulilah telah menyelesaikan Project Program Sistem Informasi ');
writeln('     Transaksi Simpan dan Penarikan dalam Sistem Koprasi yang selesai pada');
writeln('     Tanggal 30 Desember 2012 :), kami mengucapkan banyak terimakasih atas');
writeln('     dukungan, segala upaya jerih payah dan usaha yang tak mengenal lelah ');
writeln('     atas suportnya baik itu dari segi moril maupun materil.              ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                          * T E N T A N G  K A M I *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('        Kepada Bpk.Oman Komarudin M.Kom terimakasih telah memberikan Tugas');
writeln('     Akhir ini kepada kami, karena kami bisa belajar dari setiap kesulitan');
writeln('     yang akan menghadang kami nanti menuju masa depan, kami berharap dan ');
writeln('     selalu berdoa semoga Project yang kami kerjakan ini bisa berguna bagi');
writeln('     banyak orang, atas kelebihan dan kekurangannya kami mohon maaf, kami ');
writeln('     menyadari Project ini masih jauh dari kesempurnaan, karenannya kritik');
writeln('     dan saran sangat diharapkan untuk meyempurnakan Project selanjutnya. ');
writeln;
writeln('        Pada akhirnya semua itu kembali kepada Allah SWT dan kesempurnaan ');
writeln('     hanyalah milik-Nya, semoga Allah SWT menilai semua kerja keras dan   ');
writeln('     usaha dalam pembuatan Project ini sebagai ibadah yang di ridhoi oleh ');
writeln('     Allah SWT, kami mengucapkan terimakasih dan mengucap rasa syukur yang');
writeln('     sebesarnya kepada Allah SWT yang telah banyak melimpahkan rahmatnya. ');
writeln;
write(' ');lagi:=upcase(readkey)
until lagi<>'Y';
end;

Procedure Bantuan;
begin
lagi:='Y';
clrscr;
repeat
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Buat Akun Baru Nasabah');
writeln;
writeln('       Dalam pembuatan akun baru nasabah kita di minta untuk menginputkan ');
writeln('       ID Nasabah yang akan selalu di tanyakan dalam melakukan transaksi  ');
writeln('       lainnya, maka dari itu harus ingat ID Nasabah yang telah terdaftar.');
writeln('       Untuk selanjutnya kita diminta menginputkan Nama, Alamat, Pekerjaan');
writeln('       dan Penghasilan, ini untuk mengisi form Data Nasabah. Selanjutnya  ');
writeln('       kita di minta untuk menginputkan NO.KTP, Kota Tinggal dan TTL.     ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Rekening');
writeln;
writeln('       Form Rekening merupakan suatu form yang dimana kita dapat melakukan');
writeln('       kegiatan Input Saldo Pertama, Transaksi & Cek Saldo, form Rekening ');
writeln('       merupakan form inti dari Transaksi Bank didalam Sistem Koprasi ini.');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Edit Data Akun Nasabah');
writeln;
writeln('       Pada bagian form edit data nasabah ini memungkinkan kita dapat     ');
writeln('       merubah dan mengganti Data Nasabah dan Data Pribadi yang telah kita');
writeln('       inputkan sebelumnya dengan cara menginputkan ID Nasabah dan Program');
writeln('       akan mencari data sesuai ID Nasabah yang telah tersimpan di file.  ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Hapus Record Data Akun Nasabah');
writeln;
writeln('       Hapus Data ini digunakan untuk menghapus salah satu, sejumlah dan  ');
writeln('       semua Data Nasabah, Data pribadi dan Saldo Nasabah yang tersimpan  ');
writeln('       di dalam file yang berada di dalam database dengan record tertentu.');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Daftar Data Akun');
writeln;
writeln('       Daftar Data Akun berfungsi untuk menampilkan semua Data Nasabah,   ');
writeln('       Data Pribadi dan Saldo Nasabah dalam bentuk tabel agar mudah untuk ');
writeln('       di lihat oleh operator agar mudah untuk melihat semua data secara  ');
writeln('       keseluruhan dan lebih efektif dalam pencarian Data.                ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Cari Data Akun Nasabah');
writeln;
writeln('       Cari Data ini digunakan untuk mencari Data Nasabah dan Data Pribadi');
writeln('       dengan cara menginputkan ID Nasabah yang telah terdaftar sebelumnya');
writeln('       form Cari Data Akun Nasabah ini berguna untuk pencarian cepat dalam');
writeln('       pencarian Data ketika sewaktu waktu di butuhkan.                   ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Tentang Kami');
writeln;
writeln('       Form ini berisi segala informasi tentang pembuat program yang ini  ');
writeln('       yang merupakan Tugas Project Algoritma dan Pemrograman 2, maembuat ');
writeln('       System Informasi Transaksi Banking Simpan Pinjam Koprasi.          ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Bantuan');
writeln;
writeln('       Bantuan merupakan user guide sederhana bagi pengguna program agar  ');
writeln('       program software ini jelas dan mudah dimengerti oleh user.         ');
writeln;
readln;
clrscr;
writeln;
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln('                              * B A N T U A N *');
writeln('     =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
writeln;
writeln('     * Keluar');
writeln;
writeln('       Keluar Merupakan form untuk EXIT dari program ini.                 ');
writeln;
write(' ');lagi:=upcase(readkey)
until lagi<>'Y';
end;

Procedure Sub_Menu_Rekening;
begin
clrscr;
textcolor(11);
writeln;
writeln('                  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('                  * D A F T A R  S U B  M E N U  R E K E N I N G *');
writeln('                  =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
writeln('                             -=-=Rekening Option=-=-');
writeln;
writeln('                  1> Input Saldo Pertama');
writeln('                  2> Transaksi');
writeln('                  3> Cek Saldo');
writeln('                  4> Menu Utama');
writeln;
end;

Procedure Sub_Menu_Daftar;
begin
clrscr;
textcolor(11);
writeln;
writeln('          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('          * D A F T A R  S U B  M E N U  D A F T A R  D A T A  A K U N *');
writeln('          =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
writeln('                         -=-=Daftar Data Akun Option=-=-');
writeln;
writeln('          1> Daftar Data Akun Nasabah');
writeln('          2> Daftar Data Akun Pribadi');
writeln('          3> Daftar Saldo Nasabah');
writeln('          4> Menu Utama');
writeln;
end;

Procedure Sub_Menu_Hapus;
begin
clrscr;
textcolor(11);
writeln;
writeln('         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln('         * D A F T A R  S U B  M E N U  H A P U S  D A T A  R E C O R D *');
writeln('         =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-');
writeln;
writeln('                        -=-=Daftar Data Akun Option=-=-');
writeln;
writeln('         1> Hapus Record Data Akun Nasabah');
writeln('         2> Hapus Record Data Rekening');
writeln('         3> Menu Utama');
writeln;
end;


begin
clrscr;
textbackground(cyan);
Tampilan;
while true do
begin
clrscr;
textbackground(blue);
Menu;
i:=0;
while (i < 1) or (i > 9) do
begin
write('                    * Masukkan Pilihan : ');readln(i);
if (i < 1) or (i > 9) then
write (^G);
writeln(' ');

if i = 1 then
begin
clrscr;
Akun_Baru;
end
else

if i = 2 then
begin
clrscr;
Sub_Menu_Rekening;
i:=0;
while (i < 1) or (i > 9) do
begin
write('                  * Masukkan Pilihan : ');readln(i);
if (i < 1) or (i > 9) then
write (^G);

writeln(' ');
if i = 1 then
begin
Saldo_Pertama;
end
else
if i = 2 then
begin
Transaksi;
end
else
if i = 3 then
begin
Cek_Saldo;
end
else
if i = 4 then
Menu;
end;
end
else

if i = 3 then
begin
clrscr;
Edit_Data;
end
else

if i = 4 then
begin
clrscr;
Sub_Menu_Hapus;
i:=0;
while (i < 1) or (i > 9) do
begin
write('         * Masukkan Pilihan : ');readln(i);
if (i < 1) or (i > 9) then
write (^G);
writeln(' ');
if i = 1 then
begin
Hapus_Data_Nasabah;
end
else
if i = 2 then
begin
Hapus_Data_Rekening;
end
else
if i = 3 then
Menu;
end;
end
else

if i = 5 then
begin
clrscr;
Sub_Menu_Daftar;
i:=0;
while (i < 1) or (i > 9) do
begin
write('          * Masukkan Pilihan : ');readln(i);
if (i < 1) or (i > 9) then
write (^G);
writeln(' ');
if i = 1 then
begin
Daftar_Data_Nasabah;
end
else
if i = 2 then
begin
Daftar_Data_Pribadi;
end
else
if i = 3 then
begin
Daftar_Saldo_Nasabah;
end
else
if i = 4 then
Menu;
end;
end
else

if i = 6 then
begin
clrscr;
Cari_Data;
end
else

if i = 7 then
begin
clrscr;
Tentang_Kami;
end
else

if i = 8 then
begin
clrscr;
Bantuan;
end
else

if i = 9 then
EXIT;
end;
 end;
end.
