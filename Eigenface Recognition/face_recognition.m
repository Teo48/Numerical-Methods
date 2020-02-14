function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  input_image = double(rgb2gray(imread(image_path)));
  
  test_image = reshape(input_image, size((input_image),1) * size((input_image),1), 1);
  pr_img_test = eigenfaces' * (test_image - m);
  
  min_dist = [];
  
  for i = 1 : 10
    min_dist = [min_dist norm(pr_img_test - pr_img(:,i))];
  endfor
  
  [min_dist output_img_index] = min(min_dist);
end