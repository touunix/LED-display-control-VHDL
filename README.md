# ENG LED display control VHDL
###### Description
The system allows you to control the LED display. The main purpose of the exercise is to control the four digits of the LED display. The designed system, by setting buttons and switches, displays any 4-digit hexadecimal number with commas on the LED display. The designed system consists of two components: display and encoder & memory. The first is responsible for controlling the display on individual segments of the display. The second one is responsible for coding the entered bits and sending them for display. The design uses the frequency divider module to enable the display to be switched to the next digit every 1 [ms]. As a result of the verification, the student's index number was entered on the LED display in hexadecimal form, with the oldest 4 digits being entered on the next 7-segment displays, and the youngest digit being represented by dots.

Student's index number in decimal form: 181329
Student Index Number in hexadecimal format: 2C451
The oldest 4 digits displayed on the 2ch 7 - segments: C45
The youngest digit with dots: 1

###### Buttons tasks
<img src="https://user-images.githubusercontent.com/79804729/160258088-939ebd63-314b-41b6-8be8-440d034414d5.jpg" width="100%"></img>

###### Simulation results
<img src="https://user-images.githubusercontent.com/79804729/160258152-336ad6db-f454-44d5-8fa5-c7940ea581a3.jpg" width="100%"></img> 

###### Verification results
<img src="https://user-images.githubusercontent.com/79804729/160258638-a4111d94-b983-4d43-8ad9-e01bb56824d9.gif" width="100%"></img> 

###### Files description
- top_display.vhd - VHDL file with display control of individual segments of the display
- top_divider.vhd - VHDL file with frequency divider
- top_encoder.vhd - VHDL file with coding of the entered bits and sending for display
- tb.vhd - testbench file
- iup6.xdc - file with constraints for the Nexys-A7 board (FPGA xc7a100tcsg324-1)


# PL Sterowanie wyświetlaczem LED VHDL
###### Opis
Układ po zaprogramowaniu, umożliwia sterowanie wyświetlaczem LED. Głównym celem ćwiczenia jest sterowanie czterema cyframi wyświetlacza LED. Zaprojektowany układ poprzez ustawienie przycisków oraz przełączników wyświetla na wyświetlaczu LED dowolną 4 -znakową liczbę szesnastkową wraz z przecinkami. Zaprojektowany układ składa się z dwóch komponentów: display oraz encoder & memory. Pierwszy z nich jest odpowiedzialny za sterowanie wyświetlania na poszczególnych segmentach wyświetlacza. Drugi z nich jest odpowiedzialny za kodowanie wprowadzonych bitów oraz przekazanie do wyświetlenia. W projekcie został zastosowany moduł dzielnika częstotliwości, aby umożliwić przełączanie wyświetlacza na kolejną cyfrę co 1 [ms]. W przeprowadzonej weryfikacji na płytce został wprowadzony na wyświetlacz LED numer indeksu studenta w postaci heksadecymalnej, przy czym 4 najstarsze cyfry zostały wprowadzone na kolejne wyświetlacze 7 – segmentowe, a najmłodsza cyfra została przedstawiona za pomocą kropek.

Numer indeksu studenta w postaci decymalnej: 181329
Numer indeksu studenta w postaci heksadecymalnej: 2C451
4 najstarsze cyfry wyświetlane na wyświetlaczach 7 – segmentowych: 2C45
Najmłodsza cyfra przedstawiona za pomocą kropek: 1

###### Zadania przycisków
<img src="https://user-images.githubusercontent.com/79804729/160258074-ba7240f7-37df-4b5f-9a6b-faaf3f99de44.PNG" width="100%"></img>  

###### Wyniki symulacji
<img src="https://user-images.githubusercontent.com/79804729/160258152-336ad6db-f454-44d5-8fa5-c7940ea581a3.jpg" width="100%"></img> 

###### Wyniki weryfikacji
<img src="https://user-images.githubusercontent.com/79804729/160258638-a4111d94-b983-4d43-8ad9-e01bb56824d9.gif" width="100%"></img> 

###### Opis plików
- top_display.vhd - plik VHDL z sterowaniem wyświetlania na poszczególnych segmentach wyświetlacza
- top_divider.vhd - plik VHDL z dzielnikiem częstotliwości
- top_encoder.vhd - plik VHDL z kodowaniem wprowadzonych bitów oraz przekazanie do wyświetlenia 
- tb.vhd - plik testbench
- iup6.xdc - plik z ograniczeniami projektowymi dla płytki Nexys-A7 (układ FPGA xc7a100tcsg324-1)
