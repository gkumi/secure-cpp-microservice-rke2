#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>
#include <tinyxml2.h>

using json = nlohmann::json;
using namespace tinyxml2;

class BaseService {
public:
    virtual void processRequest() = 0;
};

class MicroService : public BaseService {
public:
    void processRequest() override {
        json config;
        std::ifstream configFile("/app/secure-cpp-microservice-rke2/src/config.json"); // Absolute path
        if (!configFile) {
            std::cerr << "Error: Cannot open config.json" << std::endl;
            return;
        }
        configFile >> config;
        std::cout << "Service Name: " << config["name"] << std::endl;

        XMLDocument doc;
        XMLElement* root = doc.NewElement("Response");
        root->SetAttribute("status", "success");
        doc.InsertFirstChild(root);
        doc.SaveFile("/app/secure-cpp-microservice-rke2/src/response.xml"); // Absolute path
        std::cout << "XML response generated." << std::endl;
    }
};

int main() {
    MicroService service;
    service.processRequest();
    return 0;
}
