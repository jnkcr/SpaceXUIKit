//
//  CrewDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

final class CrewDetailVC: UIViewController {
    
    let detailViewModel: CrewDetailVM
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    let infoStack: CrewDetailStack

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(infoStack)
        // UI Config
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: infoStack.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStack.readableContentGuide.bottomAnchor),
        ])
        // Long press actions
        let interaction = UIContextMenuInteraction(delegate: self)
        infoStack.wikiButton.addTarget(self, action: #selector(handleWikiButton), for: .touchUpInside)
        infoStack.imageView.addInteraction(interaction)
    }
    
    init(viewModel: CrewDetailVM) {
        detailViewModel = viewModel
        infoStack = CrewDetailStack(vm: viewModel)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CrewDetailVC {
    
    @objc
    func handleWikiButton() {
        UIApplication.shared.open(detailViewModel.wikiURL)
    }
    
}

extension CrewDetailVC: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions in
            
            let imageInBrowserAction = UIAction(title: "Open in browser", image: UIImage(systemName: "safari")) { action in
                UIApplication.shared.open(self.detailViewModel.imageURL)
            }
            
            let shareAction = UIAction(title: "Share photo", image: UIImage(systemName: "square.and.arrow.up.circle")) { action in
                guard let image = self.detailViewModel.memberPhoto else {
                    self.shownCustomAlert(description: "There has been some problem with image. Please try again later.")
                    return
                }
                let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                self.present(activityVC, animated: true)
            }
            
            return UIMenu(title: "Photo of \(self.detailViewModel.nameDescription)", image: UIImage(systemName: "list.bullet"), children: [imageInBrowserAction, shareAction])
        }
    }
    
}
