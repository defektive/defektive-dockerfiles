#! /bin/bash
set -e
dir=production-ready
for image in `cat $dir/base-images.txt`; do
  base_image=`echo $image`
  for template in `ls $dir/templates/`; do
    template_base=`echo $template | cut -d "-" -f 1`
    template_name=`echo $template | cut -d "-" -f 2`
    if [[ "$template_base" != "$base_image" && $template_base != "base" ]] ; then
      echo "skip $template"
      continue
    fi

    template_path="$dir/dist/$base_image-$template_name"
    dockerfile="$template_path/Dockerfile"
    mkdir -p $template_path

    cat > $dockerfile <<GeneratedWarning
# This file was automatically generated
# changes here will be overwritten
GeneratedWarning

    echo FROM $image >> $dockerfile
    # Head files
    cat $dir/common/$template_base/head.Dockerfile >> $dockerfile
    cat "$dir/templates/$template/Dockerfile" >> $dockerfile
    cat $dir/common/$template_base/tail.Dockerfile >> $dockerfile

  done
done


for image in `ls $dir/dist/`; do
  cd "$dir/dist/$image"
  docker build -t defektive/$image .
  # docker push defektive/$image
  cd -
done
