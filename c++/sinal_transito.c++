int led_verde = 2;
int led_amarelo = 3;
int led_vermelho = 4;

void setup(){
	pinMode(led_verde, OUTPUT); // Porta do led é uma saida digital
  	pinMode(led_amarelo, OUTPUT);
  	pinMode(led_vermelho, OUTPUT);
}
void loop(){
  
  digitalWrite(led_verde, HIGH); //acende
  delay(5000);
  digitalWrite(led_verde, LOW); // apaga
  
  digitalWrite(led_amarelo, HIGH); //acende
  delay(1000);
  digitalWrite(led_amarelo, LOW); // apaga
  
  
  digitalWrite(led_vermelho, HIGH); //acende
  delay(5000);
  digitalWrite(led_vermelho, LOW); // apaga
  
}