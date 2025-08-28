//
//  ImagePlaceholder.swift
//  ImagePlaceholder
//
//  Created by Nico Prasasty S on 27/08/25.
//

import UIKit
import SDWebImage

class ImagePlaceholder: UIImageView{
    var placeholder: UIImage?{
        didSet{
            image = placeholder
        }
    }
    var placeholderContentMode: UIView.ContentMode = .scaleAspectFit{
        didSet{
            if image == placeholder{
                contentMode = placeholderContentMode
            }
        }
    }
    var placeholderBackgroundColor: UIColor = .clear
    var placeholderTintColor: UIColor = UIColor(red: 181, green: 181, blue: 181, alpha: 1)
    var imageFetchContentModel: UIView.ContentMode = .scaleAspectFit{
        didSet{
            if image != placeholder{
                contentMode = imageFetchContentModel
            }
        }
    }
    var imageFetchBackgroundColor: UIColor = .clear
    var imageFetchTintColor: UIColor = .systemBlue
    var completionLoadImage: ((_ image: UIImage?)->Void)?
    var url: String?{
        didSet{
            if let url = url{
                sd_setImage(with: URL(string: url), placeholderImage: placeholder) { [weak self] image, _, _, _ in
                    DispatchQueue.main.async {
                        self?.completionLoadImage?(image)
                    }
                }
            }else{
                image = placeholder
                completionLoadImage?(placeholder)
            }
        }
    }
    override var image: UIImage?{
        didSet{
            if image == placeholder{
                contentMode = placeholderContentMode
                backgroundColor = placeholderBackgroundColor
                tintColor = placeholderTintColor
                image?.withRenderingMode(.alwaysTemplate)
            }else{
                contentMode = imageFetchContentModel
                backgroundColor = imageFetchBackgroundColor
                tintColor = imageFetchTintColor
                image?.withRenderingMode(.alwaysOriginal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        
    }
}
