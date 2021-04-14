//
//  PrettyUIKitHelpersTests.swift
//  PrettyUIKitHelpersTests
//
//  Created by Stas Lee on 2/2/21.
//

import XCTest
import PrettyUIKitHelpers

class PrettyConstraintsTests: XCTestCase {
    func test_convenienceInitialize_withColor() {
        let color: UIColor = .red
        let sut = makeSUT(backgroundColor: color)
        XCTAssertEqual(sut.backgroundColor, color)
    }
    
    func test_topBottomLeadingTrailingAnchors_activatesConvenientConstraints() {
        let v1 = UIView()
        
        let sut = makeSUT()
        sut.addSubview(v1)
        
        v1.anchor(
            .top(sut.topAnchor),
            .leading(sut.leadingAnchor),
            .trailing(sut.trailingAnchor),
            .bottom(sut.bottomAnchor)
        )

        XCTAssertEqual(sut.constraints.count, 4)
        XCTAssertTrue(sut.constraints.allSatisfy { $0.firstItem === v1 && $0.secondItem === v1.superview })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }
    
    func test_fillSuperview_topBottomLeadingTrailing() {
        let v1 = UIView()
        
        let sut = makeSUT()
        sut.addSubview(v1)
        
        v1.anchor(
            .top(sut.topAnchor),
            .leading(sut.leadingAnchor),
            .trailing(sut.trailingAnchor),
            .bottom(sut.bottomAnchor)
        )
        
        XCTAssertEqual(sut.constraints.count, 4)
        XCTAssertTrue(sut.constraints.allSatisfy { $0.firstItem === v1 && $0.secondItem === v1.superview })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .leading && $0.secondAttribute == .leading })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .trailing && $0.secondAttribute == .trailing })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .top && $0.secondAttribute == .top })
        XCTAssertNotNil(sut.constraints.first { $0.firstAttribute == .bottom && $0.secondAttribute == .bottom })
    }
    
    func test_updateConstraint_updatesConstraintConstant() {
        let v1 = UIView()
        
        let sut = makeSUT()
        sut.addSubview(v1)
        
        v1.anchor(
            .top(sut.topAnchor),
            .leading(sut.leadingAnchor),
            .trailing(sut.trailingAnchor),
            .bottom(sut.bottomAnchor)
        )
        
        XCTAssertEqual(v1.anchoredConstraints?.top, sut.constraints.first)
        XCTAssertEqual(v1.anchoredConstraints?.leading, sut.constraints[1])
        XCTAssertEqual(v1.anchoredConstraints?.bottom, sut.constraints[2])
        XCTAssertEqual(v1.anchoredConstraints?.trailing, sut.constraints[3])
    }
}

private extension PrettyConstraintsTests {
    func makeSUT(file: StaticString = #file, line: UInt = #line, backgroundColor: UIColor = .clear) -> UIView {
        return UIView(backgroundColor: backgroundColor)
    }
}
