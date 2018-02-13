//
//  ActivityTableViewCell.m
//  Task
//
//  Created by Sarankumar on 12/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

@synthesize titleLabel = _titleLabel;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize displayImageView = _displayImageView;
@synthesize bottomLine = _bottomLine;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    // Title Label constraints added
    _titleLabel  = [[UILabel alloc] init];
    [self.contentView addSubview: _titleLabel];
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont systemFontOfSize: titleLabelFontSize weight: UIFontWeightBold];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *tLleadingConstraint = [_titleLabel.leadingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.leadingAnchor constant: leadingConstant];
    NSLayoutConstraint *tLtrailingConstraint = [_titleLabel.trailingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.trailingAnchor constant: trailingConstant];
    NSLayoutConstraint *tLtopConstraint = [_titleLabel.topAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.topAnchor constant: topAndBottomConstant];
    // Display ImageView constraints added
    _displayImageView  = [[UIImageView alloc] init];
    [self.contentView addSubview: _displayImageView];
    _displayImageView.contentMode = UIViewContentModeScaleAspectFit;
    _displayImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *iVleadingConstraint = [_displayImageView.leadingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.leadingAnchor constant: leadingConstant];
    NSLayoutConstraint *iVtrailingConstraint = [_displayImageView.trailingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.trailingAnchor constant: trailingConstant];
    NSLayoutConstraint *iVtopConstraint = [_displayImageView.topAnchor constraintEqualToAnchor:  _titleLabel.bottomAnchor constant: topAndBottomConstant];
    NSLayoutConstraint *iVHeightConstraint = [_displayImageView.heightAnchor constraintEqualToConstant: imageViewHeightConstant];
    // Description Label constraints added
    _descriptionLabel  = [[UILabel alloc] init];
    [self.contentView addSubview: _descriptionLabel];
    _descriptionLabel.numberOfLines = 0;
    _descriptionLabel.font = [UIFont systemFontOfSize: descriptionLabelFontSize weight: UIFontWeightRegular];
    _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *dLleadingConstraint = [_descriptionLabel.leadingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.leadingAnchor constant: leadingConstant];
    NSLayoutConstraint *dLtrailingConstraint = [_descriptionLabel.trailingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.trailingAnchor constant: trailingConstant];
    NSLayoutConstraint *dLtopConstraint = [_descriptionLabel.topAnchor constraintEqualToAnchor: _displayImageView.bottomAnchor constant: topAndBottomConstant];
    // Bottom View constraints added
    _bottomLine  = [[UIView alloc] init];
    [self.contentView addSubview: _bottomLine];
    _bottomLine.backgroundColor = [UIColor lightGrayColor];
    _bottomLine.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *bLleadingConstraint = [_bottomLine.leadingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.leadingAnchor constant: leadingConstant];
    NSLayoutConstraint *bLtrailingConstraint = [_bottomLine.trailingAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.trailingAnchor constant: trailingConstant];
    NSLayoutConstraint *bLtopConstraint = [_bottomLine.topAnchor constraintEqualToAnchor: _descriptionLabel.bottomAnchor constant: topAndBottomConstant];
    NSLayoutConstraint *bLbottomConstraint = [_bottomLine.bottomAnchor constraintEqualToAnchor: self.contentView.safeAreaLayoutGuide.bottomAnchor constant: bottomLineBottomConstant];
    NSLayoutConstraint *bLHeightConstraint = [_bottomLine.heightAnchor constraintEqualToConstant: bottomLineHeightConstant];
    
    [self.contentView addConstraints: @[tLleadingConstraint, tLtrailingConstraint, tLtopConstraint, iVleadingConstraint, iVtrailingConstraint, iVtopConstraint, iVHeightConstraint, dLleadingConstraint, dLtrailingConstraint, dLtopConstraint, bLleadingConstraint, bLtrailingConstraint, bLtopConstraint, bLbottomConstraint, bLHeightConstraint]];
}

//MARK:- Configure Cell
- (void)configureCell:(Activity *)activity {
    _titleLabel.text = activity.headLine;
    _descriptionLabel.text = activity.descriptionText;
    [_displayImageView sd_setImageWithURL:[NSURL URLWithString:activity.imageURL] placeholderImage:[UIImage imageNamed:@"Upload_Image"]];

}
@end
