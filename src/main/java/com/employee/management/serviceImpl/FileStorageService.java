package com.employee.management.serviceImpl;

import org.springframework.stereotype.Service;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import com.employee.management.exception.InvalidPhotoException;

@Service
public class FileStorageService {
	



    @Value("${app.upload.dir}")
    private String uploadDir;

    public String savePhoto(MultipartFile photo) throws IOException {

        if (photo == null || photo.isEmpty()) {
        	throw new InvalidPhotoException("Please upload a photo");
        }

        String originalName = photo.getOriginalFilename();

        if (originalName == null ||
                !originalName.toLowerCase().endsWith(".png") ||
                !"image/png".equalsIgnoreCase(photo.getContentType())) {
            throw new IllegalArgumentException("Only PNG images are allowed");
        }

        Path uploadPath = Paths.get(uploadDir)
                .toAbsolutePath().normalize();

        Files.createDirectories(uploadPath);

        String fileName = UUID.randomUUID() + ".png";

        Path filePath = uploadPath.resolve(fileName);

        photo.transferTo(filePath.toFile());

        return uploadDir + "/" + fileName;
    }
}

