# GCP_Infra_Project

Project ideas:  
Podsunięte przez ChatGPT
1. Automatyczne skalowanie środowiska aplikacji w oparciu o ruch
- Opis: Stwórz system automatycznego skalowania aplikacji w oparciu o metryki ruchu użytkowników i obciążenie serwerów. Projekt koncentruje się na efektywności zarządzania zasobami.
- Usługi GCP:
    + Compute Engine: Instancje wirtualne do uruchamiania aplikacji.
    + Cloud Monitoring: Zbieranie metryk, np. CPU, RAM, ruch sieciowy.
    + Cloud Pub/Sub: Wysyłanie powiadomień o przekroczeniu progów skalowania.
- Funkcjonalności:
    + Terraform do stworzenia grupy zarządzanej z automatycznym skalowaniem.
    + Golang do stworzenia usługi analizującej metryki i wyzwalającej odpowiednie akcje (np. skalowanie w górę/dół).
    + Zautomatyzowany system wdrażania nowych instancji

2. System bezpiecznego backupu i odtwarzania
- Opis: Stwórz system do regularnego wykonywania backupów kluczowych zasobów, z opcją szybkiego odtwarzania w razie awarii.
- Usługi GCP:
    + Cloud Storage: Przechowywanie backupów.
    + Cloud KMS: Szyfrowanie backupów.
    + Cloud Scheduler: Harmonogram wykonywania zadań.
- Funkcjonalności:
    + Terraform do skonfigurowania zasobów (np. Cloud Storage, Cloud KMS).
    + Golang do aplikacji zarządzającej backupami (tworzenie, szyfrowanie, odtwarzanie).
    + Automatyczne usuwanie starych backupów po określonym czasie.

3. Wykrywanie i blokowanie nieautoryzowanych połączeń sieciowych
- Opis: Zbuduj system monitorujący ruch sieciowy i blokujący nieautoryzowane połączenia w czasie rzeczywistym.
- Usługi GCP:
    + VPC Flow Logs: Monitorowanie ruchu w sieciach VPC.
    + Cloud Functions: Automatyczne reakcje na zdarzenia.
    + Cloud Firewall: Zarządzanie regułami sieciowymi.
- Funkcjonalności:
    + Terraform do skonfigurowania VPC i reguł zapory.
    + Golang do analizy logów przepływu i identyfikowania podejrzanego ruchu.
    + Automatyczne dodawanie reguł firewall blokujących podejrzane adresy IP.
4. System monitorowania i alertowania w czasie rzeczywistym
- Opis: Stwórz system do monitorowania zdarzeń w aplikacjach i infrastrukturze w czasie rzeczywistym. Wykorzystaj Pub/Sub do przesyłania zdarzeń, a Cloud Functions do generowania alertów.
- Usługi GCP:
    + Pub/Sub: Transport komunikatów.
    + Cloud Logging: Generowanie zdarzeń.
    + Cloud Functions: Automatyczne reakcje na zdarzenia.
- Funkcjonalności:
    + Terraform do utworzenia infrastruktury Pub/Sub i konfiguracji subskrypcji.
    + Golang do aplikacji generującej zdarzenia i przesyłającej je do Pub/Sub.
    + Obsługa alertów w czasie rzeczywistym, np. poprzez e-mail, Slack, SMS.
 
5. Konfiguracja rozproszonego systemu kolejkowego w Golangu z użyciem Google Cloud Pub/Sub oraz zabezpieczenie komunikacji przez VPC
- Opis: Rozproszony system kolejkowy pozwala na niezawodne i skalowalne przetwarzanie wiadomości między aplikacjami lub mikroserwisami. Wykorzystanie Google Cloud Pub/Sub zapewnia łatwe kolejkowanie wiadomości, a integracja z VPC Service Controls chroni komunikację, ograniczając dostęp wyłącznie do autoryzowanych sieci.
- Uslugi GCP:
    + Pub/Sub: Kolejkowanie wiadomości między aplikacjami.
    + VPC Service Controls: Ograniczenie dostępu do Pub/Sub z zaufanych sieci.
    + Cloud Monitoring: Monitorowanie obciążenia systemu kolejkowego.
- Funkcjonalności:
    + Terraform: Temat i subskrypcje Pub/Sub. Konfiguracja VPC Service Controls, aby ograniczyć dostęp do Pub/Sub. IAM, aby autoryzować konkretne usługi lub konta użytkowników.
    + Golang: Publisher: Aplikacja generująca wiadomości i publikująca je w temacie Pub/Sub. Subscriber: Aplikacja konsumująca wiadomości z subskrypcji.
    + Bezpieczeństwo: VPC Service Controls blokują dostęp spoza wyznaczonej sieci. IAM kontroluje, które usługi mogą publikować i konsumować wiadomości.

6. Zabezpieczenie aplikacji w Golangu przed atakami DDoS za pomocą Google Cloud Armor oraz automatyczne wdrożenia z Terraform
- Opis: Stwórz system, który chroni aplikację w Golangu przed atakami DDoS i innymi zagrożeniami, wykorzystując Google Cloud Armor. Wdrożenie aplikacji i infrastruktury jest w pełni automatyzowane z użyciem Terraform.
- Uslugi GCP:
    + Google Cloud Armor: Ochrona przed atakami DDoS oraz możliwość definiowania reguł dostępu.
    + HTTP(S) Load Balancer: Dystrybucja ruchu oraz integracja z Cloud Armor.
    + Compute Engine / Cloud Run: Hostowanie aplikacji.
    + Terraform: Automatyzacja infrastruktury i wdrożenia aplikacji.
- Funkcjonalności:
    + Terraform: Konfiguracja Load Balancera z Google Cloud Armor.
    + Aplikacja w Golangu jakas.
    + Zabezpieczenia: Reguły Cloud Armor: Definiowanie IP, które mogą korzystać z aplikacji. Logowanie i monitoring: Integracja z Cloud Logging, aby monitorować próby nieautoryzowanego dostępu.
    + CI/CD: Pipeline Terraform do wdrożenia infrastruktury: Terraform init, plan, apply w CI/CD (np. GitHub Actions, GitLab CI). Pipeline budujący obraz Dockera aplikacji i wdrażający go na Cloud Run.


Cos z GKE?
