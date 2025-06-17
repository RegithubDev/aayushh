package com.resustainability.reisp.constants;
import org.springframework.web.bind.annotation.RequestMapping;
import java.lang.reflect.Method;
import java.util.Set;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;
import org.reflections.scanners.TypeAnnotationsScanner;
import org.reflections.util.ClasspathHelper;
import org.reflections.util.ConfigurationBuilder;

public class ApiScanner {

    public static void main(String[] args) {
        scanApis("com.resustainability.reisp.controller");
    }

    public static void scanApis(String controllerPackage) {
        // Set up Reflections to scan classes in the specified controller package
        Reflections reflections = new Reflections(new ConfigurationBuilder()
                .setUrls(ClasspathHelper.forPackage(controllerPackage))
                .setScanners(new SubTypesScanner(), new TypeAnnotationsScanner()));

        // Get all classes with the @RequestMapping annotation
        Set<Class<?>> classes = reflections.getTypesAnnotatedWith(RequestMapping.class);

        // Iterate over the classes and methods to print or store API information
        for (Class<?> clazz : classes) {
        	 System.out.println("");
            System.out.println("API Class: " + clazz.getName());
           
            // Retrieve methods annotated with @RequestMapping
            Method[] methods = clazz.getDeclaredMethods();
            for (Method method : methods) {
                if (method.isAnnotationPresent(RequestMapping.class)) {
                    RequestMapping requestMappingAnnotation = method.getAnnotation(RequestMapping.class);
                    String[] paths = requestMappingAnnotation.value();
                    System.out.println("   API Method: " + method.getName() + " - Paths: " + String.join(", ", paths));
                }
            }
        }
    }
}
