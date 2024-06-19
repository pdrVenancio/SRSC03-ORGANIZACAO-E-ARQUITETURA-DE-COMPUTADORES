int led = 6;
int btn = 4;

void setup()
{
	pinMode(led, OUTPUT);
  	pinMode(btn, INPUT); //entrada dital
}

void loop()
{
   int valor = digitalRead(btn);
   delay(50); // garantir estabilidade de leitura

    if(valor == HIGH)
      digitalWrite(led,  HIGH);
    else
      digitalWrite(led,  LOW);
}