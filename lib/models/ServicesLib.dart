library tmp.services;

import 'package:tmp/models/Service.dart';

List<Service> generate_services() {
  return [
    Service(
        name: "Frizerie1",
        date: "28.02.2021",
        time: "10:00",
        address: "str. Independentei 32",
        serverProviderFullName: "Elena Tataru"),
    Service(
        name: "test2",
        date: "28.02.2021",
        time: "12:00",
        address: "str. Puskin 3/1",
        serverProviderFullName: "Anton Vieru"),
    Service(
        name: "test3",
        date: "02.03.2021",
        time: "15:00",
        address: "str. Grigore Vieru 7",
        serverProviderFullName: "Ion Rusu"),
    Service(
        name: "test4",
        date: "04.03.2021",
        time: "10:45",
        address: "str. Docuceaev 4",
        serverProviderFullName: "Cristina Ciobanu"),
  ];
}

List<Service> testServices = generate_services();
